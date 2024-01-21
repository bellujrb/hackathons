import { Injectable } from '@nestjs/common';
import { BaseService } from '../base/baseService';
import { LoanInputDto } from 'src/dto/loan/loan-dto';
import { ScoreService } from '../score/score-service';
import { LoanEntity } from 'src/entity/loan/loan-entity';
import { LoanMake, LoanMax, UserLoan } from 'src/interface/loan/loan-interface';
import { PrismaService } from 'src/config/prisma.service';
import { StringRes } from 'src/interface/response/response-interface';

@Injectable()
export class LoanService extends BaseService {
  constructor(
    private calculerScore: ScoreService,
    private readonly repository: LoanEntity,
    private prisma: PrismaService,
  ) {
    super();
  }
  async createUserAndLoan(input: LoanInputDto) {
    try {
      const cpfVali = super.cpfReader(input.userId);
      const current = parseInt(input.current);
      const emailVali = super.emailValidate(input.email);
      const passVali = super.checkPassword(input.password);
      if (cpfVali == true && emailVali == true && passVali == true) {
        const score = await this.calculerScore.calculerScore(input);
        const loan = this.loanMax(score, current);
        const userId = super.encrypt(input.userId);
        await this.repository.postLoanUser({
          userId: userId,
          email: input.email,
          adress: input.adress,
          current: current,
          phone: input.phone,
          loan: loan.loan,
          score: score,
          name: input.name,
          password: super.encrypt(input.password),
        });
        return { res: 'User create', status: 200 };
      }
    } catch (err) {
      throw new Error(err);
    }
  }

  async getLoanDetails(email: string): Promise<UserLoan> {
    return await this.repository.getLoanUser(email);
  }

  private loanMax(score: number, current: number): LoanMax {
    switch (true) {
      case score <= 100:
        return {
          loan: 1000,
          status: 200,
        };
      case score <= 200:
        return {
          loan: 2500,
          status: 200,
        };
      case score <= 300:
        return {
          loan: 4000,
          status: 200,
        };
      case score <= 400:
        return {
          loan: 4500,
          status: 200,
        };
      case score <= 500:
        return {
          loan: 5000,
          status: 200,
        };
      case score <= 600:
        return {
          loan: 5500,
          status: 200,
        };
      case score <= 700:
        return {
          loan: 6550,
          status: 200,
        };
      case score <= 800:
        return {
          loan: 10000,
          status: 200,
        };
      case score <= 900:
        return {
          loan: 15000,
          status: 200,
        };
      case score <= 1000:
        return {
          loan: 30000,
          status: 200,
        };
      default:
        return {
          res: 'It was not possible to find your loan, try to contact our support',
          status: 404,
        };
    }
  }
  async loanNoOld(input: LoanMake) {
    const user = await this.repository.getLoanUser(input.email);
    await this.repository.loanNoOld({ email: input.email, loan: input.loan });
    return { res: 'loan was sent', status: 200 };
  }
  async loanOld(input: LoanMake) {
    const user = await this.repository.getLoanUser(input.email);
    await this.repository.loanNoOld({ email: input.email, loan: input.loan });
    return { res: 'loan was sent', status: 200 };
  }

  async loanMake(input: LoanMake): Promise<StringRes> {
    let relative: UserLoan;
    if (input.emailRelative) {
      relative = await this.repository.getLoanUser(input.emailRelative);
    }
    if (input.isOld == true && relative) {
      return await this.loanOld(input);
    } else if (input.isOld == true) {
      return {
        res: `We need your relative to create an account in our application`,
        status: 404,
      };
    }
    return await this.loanOld(input);
  }
  async getHomeUser(email: string) {
    const user = await this.repository.getLoanUser(email);
    const percentage = user.score / 1000;
    const makePercentage = percentage.toFixed(2);
    const newUser = {
      name: user.name,
      adress: user.adress,
      phone: user.phone,
      current: user.current,
      email: user.email,
      userId: user.userId,
      password: user.password,
      score: user.score,
      loan: user.loan,
      scorePorcent: parseFloat(makePercentage),
    };
    return newUser;
  }
}
