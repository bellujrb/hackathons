package erros

import base "fanify/middleware/interfaces"

type NotAcceptable struct {
	LogData       base.LogData `json:"LogData"`
	NotAcceptable Message      `json:"NotAcceptable"`
}
type InternalServerError struct {
	Response            interface{}  `json:"Response"`
	BaseReq             base.BaseReq `json:"BaseReq"`
	InternalServerError Message      `json:"InternalServerError"`
}
type Unauthorized struct {
	Response     interface{}  `json:"Response"`
	BaseReq      base.BaseReq `json:"BaseReq"`
	Unauthorized Message      `json:"Unauthorized"`
}
type Conflict struct {
	Response interface{}  `json:"Response"`
	BaseReq  base.BaseReq `json:"BaseReq"`
	Conflict Message      `json:"Conflict"`
}
type NotFound struct {
	Response interface{}  `json:"Response"`
	BaseReq  base.BaseReq `json:"BaseReq"`
	NotFound Message      `json:"NotFound"`
}

type Message struct {
	Message string `json:"message"`
}

const (
	StatusNotAcceptable       = 406
	StatusInternalServerError = 500
	StatusUnauthorized        = 401
	StatusConflict            = 409
	StatusNotFound            = 404
)

type Instance struct {
}
