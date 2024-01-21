import { Headers, Body, Controller, Get, Post } from '@nestjs/common';
import { LoanService } from '../../service';
import { ApiOkResponse, ApiTags, ApiOperation } from '@nestjs/swagger';
import {
  GetLoanInputDto,
  LoanInputDto,
  PostMakeLoanDto,
} from 'src/dto/loan/loan-dto';
import { ScoreService } from '../../service';
import { LoanEntity } from '../../entity/loan/loan-entity';
import { PrismaService } from '../../config/prisma.service';
import { LoanAllService } from 'src/service/loan/loanAll-service';
import { StringRes } from 'src/interface/response/response-interface';
import { UserLoan } from 'src/interface/loan/loan-interface';
import { StringResDTO } from 'src/dto/response/response-dto';

@ApiTags('Loan')
@Controller('/loan')
export class LoanController {
  constructor(
    private readonly service: LoanService,
    private readonly all: LoanAllService,
  ) {}
  @Post('/')
  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Create user in db',
    description: 'Creates the new user score, and adds it to our base',
  })
  async loanCalulation(@Body() loanInputDto: LoanInputDto): Promise<StringRes> {
    return await this.service.createUserAndLoan(loanInputDto);
  }
  @Get('/')
  @ApiOkResponse({ type: [LoanInputDto] })
  @ApiOperation({
    summary: 'Get user by E-mail',
    description: 'Get a specific user from the base.',
  })
  async loanGet(
    @Headers() getLoanInputDto: GetLoanInputDto,
  ): Promise<UserLoan> {
    return await this.service.getLoanDetails(getLoanInputDto.email);
  }
  @Get('/active')
  @ApiOperation({
    summary: 'Take all loans paid off',
  })
  async loanActive(@Headers() getLoanInputDto: GetLoanInputDto): Promise<any> {
    return await this.all.activeLoan(getLoanInputDto.email);
  }
  @Get('/payment')
  @ApiOperation({
    summary: 'Take all active loans',
  })
  async loanPayment(@Headers() getLoanInputDto: GetLoanInputDto): Promise<any> {
    return await this.all.paymentLoan(getLoanInputDto.email);
  }
  @Post('/make')
  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Add the loan required by the customer to the base',
    description:
      'Add the loan required by the customer to the base, seeing if he is elderly or not.',
  })
  async loanMake(@Body() postMakeLoanDto: PostMakeLoanDto): Promise<StringRes> {
    return await this.service.loanMake(postMakeLoanDto);
  }
}
