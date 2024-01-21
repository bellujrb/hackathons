import { Injectable } from '@nestjs/common';
import { CsvParser } from 'nest-csv-parser';
import { readFileSync } from 'fs';
import * as papa from 'papaparse';
import { FileFinal, FileInterface } from 'src/interface';
import { LoginInputDto } from 'src/dto';
import { PrismaService } from 'src/config/prisma.service';
import { QrService } from '../qrs/qrGenerator';
import { BaseService } from '../base/baseService';

@Injectable()
export class FileService extends BaseService {
  constructor(
    private readonly csvParser: CsvParser,
    private prisma: PrismaService,
    private readonly qrService: QrService,
  ) {
    super();
  }

  async readFile(
    file: Express.Multer.File,
    data: LoginInputDto,
  ): Promise<FileFinal> {
    try {
      const token = await this.tokenCreate();
      const csvFile = readFileSync(file.path, 'utf8');
      await this.saveDbCsv(csvFile, data, token);
      let result = await this.parsed(csvFile);
      const parsed = await this.clearPayload(result);
      const dupli = parsed[1];
      result = parsed[0];
      const duplicatesCount = result.length - dupli.length;
      return {
        request: token,
        duplicate: duplicatesCount,
        success: parsed.length,
        data: result,
      };
    } catch (error) {
      throw new Error('Erro ao ler o arquivo');
    }
  }
  async clearPayload(parsedCsv: any): Promise<any> {
    const updatedCsv = await Promise.all(
      parsedCsv.map(async (obj: any) => {
        const chave = await this.qrService.qrCreate(obj.chave);
        const devedor = {
          tipopessoa: obj.tipopessoa,
          tiporegistro: obj.tiporegistro,
          cnpj: obj.cnpj,
          nome: obj.nome,
          nomedestinado: obj.nomedestinado,
          valor: obj.valor,
        };
        return {
          cobranca: obj.cobranca,
          ocorrencia: obj.ocorrencia,
          sequencial: obj.sequencial,
          devedor: devedor,
          chave: chave,
        };
      }),
    );
    const clearCsv = Array.from(
      new Map(updatedCsv.map((obj: any) => [obj.cpf, obj])).values(),
    );

    return [updatedCsv, clearCsv];
  }
  async saveDbCsv(
    parsedCsv: string,
    data: LoginInputDto,
    token: string,
  ): Promise<void> {
    const id = data.idusuario;
    await this.prisma.billing.create({
      data: {
        idUsuario: id,
        billingData: parsedCsv,
        idRequest: token,
      },
    });
  }
  async parsed(csvFile: string): Promise<FileInterface[]> {
    const parsedCsv = await new Promise<any>((resolve, reject) => {
      papa.parse(csvFile, {
        header: true,
        skipEmptyLines: true,
        transformHeader: (header) =>
          header.toLowerCase().replace('#', '').trim(),
        complete: (results) => resolve(results.data),
        error: (error: any) => reject(error),
      });
    });
    return parsedCsv;
  }
  private async tokenCreate(): Promise<any> {
    const token = super.tokenGenerator();
    const searchToken = await this.prisma.billing.findFirst({
      where: { idRequest: token },
    });
    if (searchToken) return this.tokenCreate;
    return token;
  }
}
