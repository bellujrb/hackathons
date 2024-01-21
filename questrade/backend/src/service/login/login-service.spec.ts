import { Test, TestingModule } from '@nestjs/testing';
import { LoginService } from './login-service';
import { LoginEntity } from 'src/entity/login/login-entity';
import { mockGetLoan } from 'src/mocks/mockTests';

describe('LoginService', () => {
  let loginService: LoginService;
  let loginEntity: LoginEntity;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        LoginService,
        {
          provide: LoginEntity,
          useValue: {
            getUser: jest.fn(),
            putLogin: jest.fn(),
            putLogout: jest.fn(),
          },
        },
      ],
    }).compile();

    loginService = module.get<LoginService>(LoginService);
    loginEntity = module.get<LoginEntity>(LoginEntity);
  });

  describe('putLogin', () => {
    it('should log in the user with correct credentials', async () => {
      const putLogin = {
        email: 'test@example.com',
        password: '89467@AAAA',
      };
      jest.spyOn(loginEntity, 'getUser').mockResolvedValue(mockGetLoan);

      const result = await loginService.putLogin(putLogin);

      expect(result).toEqual({ res: 'User logged in', status: 200 });
    });

    it('should throw an error for incorrect password', async () => {
      const putLogin = {
        email: 'test@example.com',
        password: '89467@BAAA',
      };
      jest.spyOn(loginEntity, 'getUser').mockResolvedValue(mockGetLoan);
      const result = await loginService.putLogin(putLogin);
      expect(result).toEqual({
        res: 'Password Incorrect',
        status: 401,
      });
    });
  });

  describe('putLogout', () => {
    it('should log out a user', async () => {
      const putLogout = {
        email: 'test@example.com',
      };

      jest.spyOn(loginEntity, 'putLogout').mockImplementation();

      const response = await loginService.putLogout(putLogout);

      expect(loginEntity.putLogout).toHaveBeenCalledWith(putLogout.email);
      expect(response).toEqual({ res: 'User logged out', status: 200 });
    });
  });
});
