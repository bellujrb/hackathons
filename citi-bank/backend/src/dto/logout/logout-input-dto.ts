import { Injectable } from '@nestjs/common';
import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, IsString } from 'class-validator';

@Injectable()
export class LogoutInputDto {
  @ApiProperty()
  @IsString()
  idusuario: string;
}
