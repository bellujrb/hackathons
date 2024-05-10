package base

type BaseReq struct {
	LogData      LogData      `json:"LogData"`
	ResponseData ResponseData `json:"ResponseData"`
}

type LogData struct {
	ExecutionTime  string `json:"ExecutionTime"`
	HttpStatusCode int    `json:"HttpStatusCode"`
	IP             string `json:"IP"`
	Route          string `json:"Route"`
}

type ResponseData struct {
	Response interface{} `json:"Response"`
}

type Response struct {
	LogData      LogData      `json:"LogData"`
	ResponseData ResponseData `json:"ResponseData"`
}
