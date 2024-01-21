import { Module } from '@nestjs/common';
import { LoanController } from './controller';
import { LoanService, ScoreService } from './service';
import { ScoreController } from './controller/score/score-controller';
import { LoginService } from './service/login/login-service';
import { LoanEntity } from './entity/loan/loan-entity';
import { LoginController } from './controller/login/login';
import { LoginEntity } from './entity/login/login-entity';
import { LoanAllService } from './service/loan/loanAll-service';
import { EmailService } from './service/email/email-service';
import { EmailController } from './controller/email/email-controller';
import { HomeController } from './controller/home/home';
import { PrismaService } from './config/prisma.service';
import { PrismaModule } from './config/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [
    LoanController,
    ScoreController,
    LoginController,
    EmailController,
    HomeController,
  ],
  providers: [
    LoanService,
    ScoreService,
    LoginService,
    LoanAllService,
    LoanEntity,
    EmailService,
    LoginEntity,
    PrismaService,
  ],
})
export class AppModule {}
