import { Injectable } from '@nestjs/common';
import { ApiAcceptedResponse, ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsObject, IsString } from 'class-validator';

@Injectable()
export class ObjectResDTO {
  @ApiProperty()
  @IsObject()
  res: Object;

  @ApiProperty()
  @IsNumber()
  status: number;
}

@Injectable()
export class StringResDTO {
  @ApiProperty()
  @IsString()
  res: string;

  @ApiProperty()
  @IsNumber()
  status: number;
}

@Injectable()
export class UserGetDTO {
  @ApiProperty()
  @IsString()
  name: string;

  @ApiProperty()
  @IsString()
  adress: string;

  @ApiProperty()
  @IsString()
  phone: string;

  @ApiProperty()
  @IsNumber()
  current: number;

  @ApiProperty()
  @IsString()
  email: string;

  @ApiProperty()
  @IsString()
  userId: string;

  @ApiProperty()
  @IsString()
  password: string;

  @ApiProperty()
  @IsNumber()
  score: number;

  @ApiProperty()
  @IsNumber()
  loan: number;
}
