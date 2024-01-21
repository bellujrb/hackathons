import {
  Controller,
  Post,
  UseInterceptors,
  UploadedFile,
  Get,
  Headers,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { ApiResponse, ApiTags } from '@nestjs/swagger';


@Controller('')
export class TesteController {
  constructor(){}
  @Get("/")
  async teste(){
    return 'funciona :)'
  }
}
