import {
  Injectable,
  NotAcceptableException,
  NotFoundException,
} from '@nestjs/common';
import { RegisterInputDto } from '../../dto';
import { PrismaService } from '../../config/prisma.service';
import { BaseService } from '../base/baseService';
import { RegisterData } from 'src/interface/register/registerInterface';
@Injectable()
export class RegisterService extends BaseService {
  constructor(private prisma: PrismaService) {
    super();
  }
  async registerUser(data: RegisterInputDto):Promise<RegisterData> {
    try {
      return this.prisma.register.create({
        data: {
          name: data.name,
          password: super.encrypt(data.password),
          idUsuario: data.idusuario,
        },
      });
    } catch (e) {
      throw new NotFoundException(e);
    }
  }
}
