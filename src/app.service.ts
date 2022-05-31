import { Injectable } from '@nestjs/common';
import { PrismaService } from './services/prisma/prisma.service';

@Injectable()
export class AppService {
  constructor(private prisma: PrismaService) {}

  async getHello(): Promise<any> {
    return await this.prisma.tweets.findMany();
  }
}
