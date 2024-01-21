import { Test, TestingModule } from '@nestjs/testing';
import { LoanService } from './loan-service';
import { LoanInputDto } from 'src/dto/loan/loan-dto';
import { ScoreService } from '../score/score-service';
import { LoanEntity } from 'src/entity/loan/loan-entity';
import { PrismaService } from 'src/config/prisma.service';
import {
  mockGetLoan,
  mockLoanMakeFalse,
  mockLoanMakeTrue,
} from 'src/mocks/mockTests';

describe('LoanService', () => {
  let loanService: LoanService;
  let scoreService: ScoreService;
  let loanEntity: LoanEntity;
  let prismaService: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [LoanService, ScoreService, LoanEntity, PrismaService],
    }).compile();

    loanService = module.get<LoanService>(LoanService);
    scoreService = module.get<ScoreService>(ScoreService);
    loanEntity = module.get<LoanEntity>(LoanEntity);
    prismaService = module.get<PrismaService>(PrismaService);
  });

  describe('createUserAndLoan', () => {
    it('should create user and loan', async () => {
      const loanInputDto: LoanInputDto = {
        name: 'string',
        adress: 'string',
        phone: 'string',
        current: '0',
        email: 'test@gmail.com',
        userId: '40530725061',
        password: '4053012@AA',
      };
      const expectedResponse = { res: 'User create', status: 200 };

      jest.spyOn(loanService, 'cpfReader').mockReturnValue(true);
      jest.spyOn(loanService, 'emailValidate').mockReturnValue(true);
      jest.spyOn(loanService, 'checkPassword').mockReturnValue(true);
      jest.spyOn(scoreService, 'calculerScore').mockResolvedValue(500);
      jest.spyOn(loanService, 'encrypt').mockReturnValue('encryptedUserId');
      jest.spyOn(loanEntity, 'postLoanUser').mockResolvedValue();

      const result = await loanService.createUserAndLoan(loanInputDto);

      expect(result).toEqual(expectedResponse);
    });
  });

  describe('getLoanDetails', () => {
    it('should get loan details', async () => {
      const email = 'caximo2508@kameili.com';
      const expectedUserLoan = mockGetLoan;

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(expectedUserLoan);

      const result = await loanService.getLoanDetails(email);

      expect(result).toEqual(expectedUserLoan);
    });
  });

  describe('loanNoOld', () => {
    it('should update loan for a non-old user', async () => {
      const input = { email: 'test@example.com', loan: 5000 };
      const expectedResponse = { res: 'loan was sent', status: 200 };

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(mockGetLoan);
      jest.spyOn(loanEntity, 'loanNoOld').mockResolvedValue();

      const result = await loanService.loanNoOld(input);

      expect(result).toEqual(expectedResponse);
    });
  });

  describe('loanOld', () => {
    it('should update loan for an old user', async () => {
      const input = { email: 'test@example.com', loan: 5000 };
      const expectedResponse = { res: 'loan was sent', status: 200 };

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(mockGetLoan);
      jest.spyOn(loanEntity, 'loanNoOld').mockResolvedValue();

      const result = await loanService.loanOld(input);

      expect(result).toEqual(expectedResponse);
    });
  });

  describe('loanMake', () => {
    it('should make loan for non-old user', async () => {
      const input = { emailRelative: 'relative@example.com', isOld: false };
      const expectedResponse = { res: 'loan was sent', status: 200 };

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(mockGetLoan);
      jest.spyOn(loanService, 'loanOld').mockResolvedValue(expectedResponse);

      const result = await loanService.loanMake(mockLoanMakeFalse);

      expect(result).toEqual(expectedResponse);
    });

    it('should return error message for old user without relative', async () => {
      const input = { emailRelative: '', isOld: true };
      const expectedResponse = {
        res: 'We need your relative to create an account in our application',
        status: 404,
      };

      const result = await loanService.loanMake(mockLoanMakeTrue);

      expect(result).toEqual(expectedResponse);
    });

    it('should make loan for old user with relative', async () => {
      const input = { emailRelative: 'relative@example.com', isOld: true };
      const expectedResponse = { res: 'loan was sent', status: 200 };

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(mockGetLoan);
      jest.spyOn(loanService, 'loanOld').mockResolvedValue(expectedResponse);

      const result = await loanService.loanMake(mockLoanMakeTrue);

      expect(result).toEqual(expectedResponse);
    });
  });

  describe('getHomeUser', () => {
    it('should get user details', async () => {
      const email = 'test@example.com';
      const expectedUserLoan = {
        id: 13,
        userId: '$2b$10$hz/63XhONw7ErSayQDNg5OnO5Y.eJo8hUOVxZF03BQ0EZ/2js/QAK',
        email: 'xegoniy770@iturchia.com',
        adress: 'string',
        current: 100000,
        phone: 'string',
        loan: 30000,
        score: 916,
        password:
          '$2b$10$LmCW/67tIXJB2gmhR03ttuOghgXiY.nMMj34rfN8cp3/tDDK.NcCW',
        name: 'string',
      };

      jest.spyOn(loanEntity, 'getLoanUser').mockResolvedValue(mockGetLoan);

      const result = await loanService.getHomeUser(email);

      expect(result).toEqual(expectedUserLoan);
    });
  });
});
