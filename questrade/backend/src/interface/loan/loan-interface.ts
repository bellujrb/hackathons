export interface UserLoan {
  id?: number;
  userId: string;
  email: string;
  adress: string;
  current: number;
  phone: string;
  loan: number;
  score: number;
  password: string;
  name: string;
}

export interface LoanMax {
  loan?: number;
  res?: string;
  status: number;
}

export interface LoanMake {
  email: string;
  loan: number;
  isOld?: boolean;
  emailRelative?: string;
}
