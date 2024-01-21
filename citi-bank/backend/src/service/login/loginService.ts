import {
  Injectable,
  NotAcceptableException,
  NotFoundException,
} from '@nestjs/common';
import { LoginInputDto } from '../../dto';
import { PrismaService } from '../../config/prisma.service';
import { BaseService } from '../base/baseService';
@Injectable()
export class LoginService extends BaseService {
  constructor(private prisma: PrismaService) {
    super();
  }
  async getUser(loginInputDto: LoginInputDto) {
    try {
      if (!super.emailValidate(loginInputDto.idusuario))
        throw new NotAcceptableException('E-mail invalid');
      const result = await this.prisma.register.findFirst({
        where: { idUsuario: loginInputDto.idusuario },
      });
      const user = await this.prisma.login.create({
        data: {
          idUsuario: loginInputDto.idusuario,
          isLogged: true,
        },
      });
      return user;
    } catch (e) {
      throw new NotFoundException(e, 'User not exist');
    }
  }
  async logout(loginInputDto: LoginInputDto) {
    try {
      if (!super.emailValidate(loginInputDto.idusuario))
        throw new NotAcceptableException('E-mail invalid');
      const result = await this.prisma.register.findFirst({
        where: { idUsuario: loginInputDto.idusuario },
      });
      await this.prisma.login.delete({
        where: {
          id: result.id,
        },
      });
      const user = await this.prisma.login.create({
        data: {
          idUsuario: loginInputDto.idusuario,
          isLogged: false,
        },
      });
      return user;
    } catch (e) {
      throw new NotFoundException(e, 'User not exist');
    }
  }
}
