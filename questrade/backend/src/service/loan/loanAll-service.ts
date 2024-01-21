import { Injectable } from '@nestjs/common';
import { BaseService } from '../base/baseService';
import { ScoreService } from '../score/score-service';
import { LoanEntity } from 'src/entity/loan/loan-entity';
import { Active, Payment } from 'src/mocks/mockLoan';

@Injectable()
export class LoanAllService extends BaseService {
  constructor(private repository: LoanEntity) {
    super();
  }
  async paymentLoan(email: string) {
    return Payment;
  }
  async activeLoan(email: string) {
    return Active;
  }
}
