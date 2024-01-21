import { Headers, Controller, Get, Post, Put, Body } from '@nestjs/common';
import { ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import { PutLogin, PutLogout } from 'src/dto/login/login-dto';
import { StringResDTO } from 'src/dto/response/response-dto';
import { StringRes } from 'src/interface/response/response-interface';
import { LoginService } from 'src/service/login/login-service';

@ApiTags('Login')
@Controller('/')
export class LoginController {
  constructor(private readonly service: LoginService) {}

  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Login user by e-mail',
  })
  @Put('/login')
  async loanGet(@Body() putLogin: PutLogin): Promise<StringRes> {
    return this.service.putLogin(putLogin);
  }
  @ApiOkResponse({ type: [StringResDTO] })
  @ApiOperation({
    summary: 'Logout user by e-mail',
  })
  @Put('/logout')
  async logoutUser(@Body() putLogout: PutLogout): Promise<StringRes> {
    return this.service.putLogout(putLogout);
  }
}
