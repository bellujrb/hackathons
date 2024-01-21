import { Body, Headers, Controller, Get, Post } from '@nestjs/common';
import { LoanService } from '../../service';
import { ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import {
  GetLoanInputDto,
  LoanInputDto,
  PostMakeLoanDto,
} from 'src/dto/loan/loan-dto';
import { LoanAllService } from 'src/service/loan/loanAll-service';
import { UserGetDTO } from 'src/dto/response/response-dto';

@ApiTags('Home')
@Controller('/home')
export class HomeController {
  constructor(private readonly service: LoanService) {}

  @ApiOkResponse({ type: [UserGetDTO] })
  @ApiOperation({
    summary: 'Logout user by e-mail',
  })
  @Get('/')
  async loanCalulation(@Headers() loanInputDto: GetLoanInputDto): Promise<any> {
    return await this.service.getHomeUser(loanInputDto.email);
  }
}
