import { Body, Controller, Get, Post } from '@nestjs/common';
import { ScoreService } from '../../service';
import { ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import { LoanInputDto } from 'src/dto/loan/loan-dto';
import { ObjectResDTO } from 'src/dto/response/response-dto';

@ApiTags('Loan')
@Controller('/score')
export class ScoreController {
  constructor(private readonly service: ScoreService) {}

  @Get('/')
  @ApiOkResponse({ type: [ObjectResDTO] })
  @ApiOperation({
    summary: 'Get Max and Min for score',
    description: 'Get Max and Min for score.',
  })
  getScoreMinMax(): any {
    return this.service.maxMin();
  }
}
