import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/config/prisma.service';
import { UserLoan } from 'src/interface/loan/loan-interface';
import { LoanService } from 'src/service';

@Injectable()
export class LoanEntity {
  constructor(private prisma: PrismaService) {}
  async postLoanUser(user: UserLoan) {
    try {
      await this.prisma.loan.create({
        data: {
          userId: user.userId,
          email: user.email,
          adress: user.adress,
          current: user.current,
          phone: user.phone,
          loan: user.loan,
          score: user.score,
          name: user.name,
          password: user.password,
        },
      });
    } catch (err) {
      throw new Error(err);
    }
  }
  async getLoanUser(email: string): Promise<UserLoan> {
    return await this.prisma.loan.findFirst({ where: { email: email } });
  }
  async loanNoOld(user: any) {
    await this.prisma.make.create({
      data: {
        email: user.mail,
        loan: user.loan,
        isOld: false,
      },
    });
  }
  async loanOld(user: any) {
    await this.prisma.make.create({
      data: {
        email: user.mail,
        loan: user.loan,
        isOld: true,
      },
    });
  }
  async getHome(email: string) {
    const user = await this.prisma.loan.findFirst({ where: { email: email } });
  }
}
