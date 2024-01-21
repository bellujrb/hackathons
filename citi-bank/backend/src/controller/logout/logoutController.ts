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
  import { LogoutInputDto } from '../../dto/';

  @ApiTags('Register')
  @Controller('/logout')
  export class LogoutController {
    constructor(private readonly service: LoginService) {}
    @Get('/')
    async logout(@Headers() logoutInputDto: LogoutInputDto) {
      return await this.service.logout(logoutInputDto);
    }
  }
  