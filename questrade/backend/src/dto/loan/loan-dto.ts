import { Injectable } from '@nestjs/common';
import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, IsString } from 'class-validator';

@Injectable()
export class LoanInputDto {
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
  @IsString()
  current: string;

  @ApiProperty()
  @IsString()
  email: string;

  @ApiProperty()
  @IsString()
  userId: string;

  @ApiProperty()
  @IsString()
  password: string;
}
@Injectable()
export class GetLoanInputDto {
  @ApiProperty()
  @IsString()
  email: string;
}
@Injectable()
export class PostMakeLoanDto {
  @ApiProperty()
  @IsString()
  email: string;
  @ApiProperty()
  @IsNumber()
  loan: number;
  @ApiProperty()
  @IsOptional()
  @IsString()
  emailRelative: string;
}
