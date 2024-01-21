import { Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { LoanEntity } from 'src/entity/loan/loan-entity';

@Module({
  providers: [PrismaService, LoanEntity],
  exports: [PrismaService, LoanEntity],
})
export class PrismaModule {}
