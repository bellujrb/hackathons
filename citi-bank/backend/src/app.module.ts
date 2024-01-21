import { Module } from '@nestjs/common';
import {
  LoginController,
  RegisterController,
  FileController,
} from './controller/';
import {
  LoginService,
  RegisterService,
  FileService,
  QrService,
  FileServiceEmail,
} from './service/index';
import { PrismaService } from './config/prisma.service';
import { CsvModule } from 'nest-csv-parser';
import { DateManipulator } from './util/date';

@Module({
  imports: [CsvModule],
  controllers: [LoginController, RegisterController, FileController],
  providers: [
    RegisterService,
    LoginService,
    PrismaService,
    FileService,
    QrService,
    FileServiceEmail,
    DateManipulator,
  ],
})
export class AppModule {}
