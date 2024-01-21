import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/config/prisma.service';
import * as send from 'nodemailer';
import * as fs from 'fs';
import * as path from 'path';
import { FileEmailInputDto } from 'src/dto';
import { promisify } from 'util';
import { DateManipulator } from '../../util/date';
import { FileService } from './fileService';
import * as parseCsv from 'csv-writer';
import { QrService } from '../qrs/qrGenerator';
import { setTimeout } from 'timers/promises';
import { Csv, DbFileCsv, ResponseCsv } from 'src/interface';

@Injectable()
export class FileServiceEmail {
  constructor(
    private prisma: PrismaService,
    private readonly dateName: DateManipulator,
    private readonly json: FileService,
    private readonly qrService: QrService,
  ) {}
  async emailSend(data: FileEmailInputDto): Promise<ResponseCsv> {
    const name = this.dateName.YMDHMS();
    const filePath = `csvSend/${name}.csv`;
    const csv = await this.csv(data.idRequest);
    await this.csvForJson(csv, filePath);
    const attachment = {
      filename: path.basename(filePath),
      path: filePath,
    };
    await this.sendMail(data, attachment);
    await this.deleteFileAfterDelay(filePath);
    return { Response: 'Email enviado ' };
  }

  private async sendMail(
    data: FileEmailInputDto,
    attachment: any,
  ): Promise<void> {
    const sender = {
      email: process.env.EMAIL,
      password: process.env.PASSWORD,
    };
    const transporter = send.createTransport({
      service: 'gmail',
      auth: {
        user: sender.email,
        pass: sender.password,
      },
    });
    const mailOptions = {
      from: sender.email,
      to: data.email,
      subject: `Csv`,
      text: `Olá,
      Obrigado por utilizar nosso serviço! Segue em anexo o arquivo CSV contendo os dados solicitados.
      
      Fique à vontade para entrar em contato caso precise de alguma outra informação ou suporte adicional.
      
      Atenciosamente,
      Innov4Pix
      `,
      attachments: [attachment],
    };
    transporter.sendMail(mailOptions, (error: any, info: any) => {
      if (error) {
        throw new Error(error);
      }
    });
    return;
  }

  private async csvForJson(csv: string, filePath: string): Promise<Object> {
    const csvOrganization = [
      { id: 'cpf', title: 'cpf' },
      { id: 'nome', title: 'nome' },
      { id: 'tiporegistro', title: 'tiporegistro' },
      { id: 'tipopessoa', title: 'tipopessoa' },
      { id: 'chave', title: 'chave' },
      { id: 'cobranca', title: 'cobranca' },
      { id: 'ocorrencia', title: 'ocorrencia' },
      { id: 'sequencial', title: 'sequencial' },
      { id: 'nomedestinado', title: 'nomedestinado' },
      { id: 'valor', title: 'valor' },
    ];

    const json = await this.json.parsed(csv);
    const jsonParse = await this.updateJson(json);
    const csvWriter = parseCsv.createObjectCsvWriter({
      path: filePath,
      header: csvOrganization,
    });
    await csvWriter.writeRecords(jsonParse);
    return csvWriter;
  }

  private async updateJson(csv: any): Promise<any[]> {
    const updatedCsv = await Promise.all(
      csv.map(async (obj) => {
        obj.chave = await this.qrService.qrCreate(obj.chave);
        return obj;
      }),
    );
    return updatedCsv;
  }

  private async csv(idRequest: string): Promise<string> {
    const user = await this.prisma.billing.findFirst({
      where: { idRequest: idRequest },
    });
    return user.billingData;
  }

  async deleteFile(filePath: string) {
    fs.unlink(filePath, (err) => {
      if (err) {
        console.error(err);
        return;
      }
    });
  }

  async deleteFileAfterDelay(filePath: string): Promise<void> {
    await setTimeout(5000);
    try {
      this.deleteFile(filePath);
    } catch (error) {
      console.error(error);
    }
  }
}
