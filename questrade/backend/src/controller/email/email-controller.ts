import { Headers, Controller, Get } from '@nestjs/common';
import { ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import { GetEmail } from 'src/dto/email/email-dto';
import { StringResDTO } from 'src/dto/response/response-dto';
import { StringRes } from 'src/interface/response/response-interface';
import { EmailService } from 'src/service/email/email-service';

@ApiTags('Mail')
@Controller('/mail')
export class EmailController {
  constructor(private service: EmailService) {}
  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Send email for support',
    description:
      'sends an email to the user who asks for support saying that he will get in touch, to help him',
  })
  @Get('/support')
  async getSuport(@Headers() email: GetEmail): Promise<StringRes> {
    return await this.service.mailSuport(email.email);
  }

  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Send email for loan valids',
    description:
      'sends an email to the user about his loan, and about the amounts that were requested in his name.',
  })
  @Get('/valid')
  async getValidEmail(@Headers() email: GetEmail): Promise<StringRes> {
    return await this.service.mailIsValid(email.email);
  }
}
