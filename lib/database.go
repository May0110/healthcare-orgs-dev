package lib

import (
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v4/pgxpool"

	"github.com/jackc/pgx/v4"
)

type Database struct {
	connPool *pgxpool.Pool
}

func InitDB(connString string) (*Database, error) {
	conn, err := pgxpool.Connect(context.Background(), connString)
	if err != nil {
		err = fmt.Errorf("unable to connect to Database => %w", err)

		return nil, err
	}

	return &Database{connPool: conn}, nil
}

// ExecuteQuery executes query with given arguments.
// It returns *pgx.Conn and pgx.Rows objects
// NB! beware that you need to close both of these objects after usage
func (db *Database) ExecuteQuery(sql string, arguments ...interface{}) (rows pgx.Rows, err error) {
	conn, err := db.connPool.Acquire(context.Background())
	defer conn.Release()
	if err != nil {
		return nil, fmt.Errorf("unable to get DB connection: %w", err)
	}
	// execute query
	rows, err = conn.Query(context.Background(), sql, arguments...)
	if err != nil {
		err = fmt.Errorf("unable to run the sql query => %s", err.Error())

		fmt.Printf("DB ERROR => %v", err)

		return nil, err
	}

	return
}

// ExecuteDDL runs a DDL statement
func (db *Database) ExecuteDDL(sql string) (err error) {
	// execute DDL !
	_, err = db.connPool.Exec(context.Background(), sql)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to execute DDL! Error =>%v\n", err)
	}

	return err
}

// ExecuteDML starts a transaction, runs a DML statement (insert, update, delete)
// and commits it afterwards (or executes rollback in case of and error )
func (db *Database) ExecuteDML(sql string, arguments ...interface{}) (err error) {
	// Database CONNECT
	conn, err := db.connPool.Acquire(context.Background())
	if err != nil {
		return fmt.Errorf("unable to get DB connection: %w", err)
	}
	defer conn.Release()

	// transaction BEGIN
	tx, err := conn.Begin(context.Background())
	if err != nil {
		err = fmt.Errorf("unable to begin transaction: %s", err.Error())

		return err
	}

	// rollback is safe to call even if the tx is already closed
	// so if the tx commits successfully, this is a no-op
	defer tx.Rollback(context.Background())

	// execute DML !
	var commandTag []byte
	commandTag, err = tx.Exec(context.Background(), sql, arguments...)
	if err != nil {
		err = fmt.Errorf("unable to execute DML: %s", err.Error())

		return err
	}

	fmt.Printf("COMMAND result => %s\n", string(commandTag))

	// transaction COMMIT
	err = tx.Commit(context.Background())
	if err != nil {
		err = fmt.Errorf("unable to commit transaction: %s", err.Error())

		return err
	}

	return
}

// Insert starts a transaction, runs an statement
// and commits it afterwards (or executes rollback in case of and error)
// Insert returns the ID of the inserted row
func (db *Database) Insert(sql string, arguments ...interface{}) (insertedRowID int, err error) {
	// Database CONNECT
	conn, err := db.connPool.Acquire(context.Background())
	if err != nil {
		return -1, fmt.Errorf("unable to CONNECT to Database: %w", err)
	}
	defer conn.Release()

	// transaction BEGIN
	tx, err := conn.Begin(context.Background())
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to BEGIN transaction: %v\n", err)

		return -1, err
	}

	// rollback is safe to call even if the tx is already closed
	// so if the tx commits successfully, this is a no-op
	defer tx.Rollback(context.Background())

	// execute DML !
	err = tx.QueryRow(context.Background(), sql, arguments...).Scan(&insertedRowID)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to perform INSERT! Error => %v\n", err)

		return -1, err
	}

	// transaction COMMIT
	err = tx.Commit(context.Background())
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to COMMIT transaction: %v\n", err)

		return -1, err
	}

	return insertedRowID, nil
}
