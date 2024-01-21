import { Injectable } from '@nestjs/common';
import { BaseService } from '../base/baseService';
import { PutLogin, PutLogout } from 'src/dto/login/login-dto';
import { LoginEntity } from 'src/entity/login/login-entity';

@Injectable()
export class LoginService extends BaseService {
  constructor(private repository: LoginEntity) {
    super();
  }
  async putLogin(putLogin: PutLogin) {
    try {
      const user = await this.repository.getUser(putLogin.email);
      const compare = await super.compare(putLogin.password, user.password);
      if (compare == true) {
        await this.repository.putLogin(putLogin.email);
        return { res: 'User logged in', status: 200 };
      }
      return { res: 'Password Incorrect', status: 401 };
    } catch (err) {
      throw new Error(err);
    }
  }
  async putLogout(putLogout: PutLogout) {
    try {
      await this.repository.putLogout(putLogout.email);
      return { res: 'User logged out', status: 200 };
    } catch (err) {
      throw new Error(err);
    }
  }
}
