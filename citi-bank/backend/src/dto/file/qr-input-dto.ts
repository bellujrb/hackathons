import { Injectable } from '@nestjs/common';
import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, IsString } from 'class-validator';

@Injectable()
export class QrInputDto {
  @ApiProperty()
  @IsString()
  idusuario: string;
}