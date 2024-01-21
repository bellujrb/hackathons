export interface FileInterface {
  cpf: string;
  nomeEmpresa: string;
  qr: string;
  razaoSocial: string;
}
export interface FileFinal {
  request: string;
  duplicate?: number;
  success: number;
  data: FileInterface[];
}

export interface Csv {
  cpf: String;
  nomeEmpresa: String;
  qr: String;
  razaoSocial: String;
}

export interface DbFileCsv {
  idUsuario: String;
  BillingData: String;
  idRequest: String;
}

export interface ResponseCsv {
  Response: String;
}
