import {
  Controller,
  Post,
  UseInterceptors,
  UploadedFile,
  Get,
  Headers,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { RegisterService } from '../../service/index';
import { ApiResponse, ApiTags } from '@nestjs/swagger';
import { RegisterInputDto } from '../../dto'

@ApiTags('Register')
@Controller('/register')
export class RegisterController {
  constructor(private readonly service: RegisterService){}
  @Post("/")
  async registerNewUser(@Headers() registerInputDto:RegisterInputDto){
    return await this.service.registerUser(registerInputDto)
  }
}
