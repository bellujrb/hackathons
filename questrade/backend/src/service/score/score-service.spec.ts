import { Test, TestingModule } from '@nestjs/testing';
import { ScoreService } from './score-service';
import { ScoreInputDto } from 'src/dto/score/score-dto';
import { persona } from 'src/mocks/mockScore';

describe('ScoreService', () => {
  let scoreService: ScoreService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ScoreService],
    }).compile();

    scoreService = module.get<ScoreService>(ScoreService);
  });

  describe('calculerScore', () => {
    it('should calculate the score based on input', async () => {
      const input: ScoreInputDto = {
        current: '10000',
        userId: '40530725061',
      };

      const expectedScore = 519;

      const score = await scoreService.calculerScore(input);

      expect(score).toEqual(expectedScore);
    });

    it('should handle no debtsOpen', async () => {
      const input: ScoreInputDto = {
        current: '10000',
        userId: '40530725061',
      };
      const expectedScore = 519;

      const score = await scoreService.calculerScore(input);

      expect(score).toEqual(expectedScore);
    });
  });
});
