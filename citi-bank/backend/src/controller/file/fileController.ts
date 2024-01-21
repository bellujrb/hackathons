import {
  Controller,
  Post,
  UseInterceptors,
  UploadedFile,
  Headers,
  Get,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { ApiConsumes, ApiBody, ApiTags } from '@nestjs/swagger';
import { FileService, QrService } from 'src/service/';
import { FileEmailInputDto, LoginInputDto } from 'src/dto/';
import { diskStorage } from 'multer';
import { FileServiceEmail } from 'src/service/file/fileEmail';

@Controller('/file')
export class FileController {
  constructor(
    private readonly service: FileService,
    private readonly email: FileServiceEmail,
  ) {}

  @Post('upload')
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(
    FileInterceptor('file_asset', {
      storage: diskStorage({
        destination: '/csv',
      }),
    }),
  )
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        file_asset: {
          type: 'string',
          format: 'binary',
        },
      },
    },
  })
  @ApiTags('File')
  async uploadFile(
    @Headers() loginInputDto: LoginInputDto,
    @UploadedFile() file: Express.Multer.File,
  ) {
    const result = await this.service.readFile(file, loginInputDto);
    return result;
  }
  @Get('sendMail')
  @ApiTags('File')
  async sendMail(@Headers() FileEmailInputDto: FileEmailInputDto) {
    const result = await this.email.emailSend(FileEmailInputDto);
    return result;
  }
}
