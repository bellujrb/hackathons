import { Injectable } from '@nestjs/common';
import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, IsString } from 'class-validator';

@Injectable()
export class LoginInputDto {
  @ApiProperty()
  @IsString()
  idusuario: string;
}
