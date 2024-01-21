import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/config/prisma.service';
@Injectable()
export class LoginEntity {
  constructor(private prisma: PrismaService) {}
  async putLogin(email: string) {
    try {
      const user = await this.prisma.login.findFirst({
        where: {
          email: email,
        },
      });
      if (user != null && user.isLogged == true) {
        throw new Error(`User is Logged`);
      }
      if (user) {
        await this.prisma.login.delete({
          where: { id: user.id },
        });
      }
      await this.prisma.login.create({
        data: {
          email: email,
          isLogged: true,
        },
      });
      return 'work';
    } catch (err) {
      throw new Error(err);
    }
  }
  async putLogout(email: string) {
    const user = await this.prisma.login.findFirst({
      where: {
        email: email,
      },
    });
    if (user) {
      await this.prisma.login.delete({
        where: { id: user.id },
      });
    }
    await this.prisma.login.create({
      data: {
        email: email,
        isLogged: false,
      },
    });
  }
  async getUser(email: any) {
    return await this.prisma.loan.findFirst({ where: { email: email } });
  }
}
