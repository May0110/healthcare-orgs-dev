package lib

const PRIORITY_CRITICAL int = 30
const PRIORITY_HIGH int = 20
const PRIORITY_NORMAL int = 10

var Logger *LoggerType

type LoggerType struct {
	priority int
}

// log message
func (logger *LoggerType) Log(priority int, message string) {
	if priority >= logger.priority {
		println(message)
	}
}

// set priority
func (l *LoggerType) SetPriority(priority int) {
	l.priority = priority
}

func NewLogger(priority int) *LoggerType {
	return &LoggerType{priority: priority}
}
