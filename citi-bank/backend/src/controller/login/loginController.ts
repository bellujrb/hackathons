import {
  Controller,
  Post,
  UseInterceptors,
  UploadedFile,
  Get,
  Headers,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { LoginService } from '../../service/index';
import { ApiResponse, ApiTags } from '@nestjs/swagger';
import { LoginInputDto } from '../../dto/';
@ApiTags('Register')
@Controller('/login')
export class LoginController {
  constructor(private readonly service: LoginService) {}
  @Get('/')
  async login(@Headers() loginInputDto: LoginInputDto) {
    return await this.service.getUser(loginInputDto);
  }
}
