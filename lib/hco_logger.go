package lib

const PRIORITY_CRITICAL int = 30
const PRIORITY_HIGH int = 20
const PRIORITY_NORMAL int = 10

type Logger struct {
	priority int
}

// log message
func (logger *Logger) Log(priority int, message string) {
	if priority >= logger.priority {
		println(message)
	}
}

// set priority
func (l *Logger) SetPriority(priority int) {
	l.priority = priority
}
