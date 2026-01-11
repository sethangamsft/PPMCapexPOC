
import cds from '@sap/cds';
// import { HierarchyLevelCalculator } from './utils/HierarchyLevelCalculator.js';
//  const { SELECT, INSERT, UPDATE, DELETE } = cds.ql;

export class S4Service extends cds.ApplicationService {

  async init() {
    this.remote = await cds.connect.to('API_PROJECTPORTFOLIO');
    this.on('READ', 'ProjectPortfolio', async req => this.runRemote(req));
    this.on('READ', 'ProjectPortfolioItem', async req => this.runRemote(req));
    this.on('READ', 'ProjectPortfolioBucket', async req => this.runRemote(req));
    this.on('CREATE', 'ProjectPortfolioItem', async req => this.createPortifolioItem(req));
    this.on('UPDATE', 'ProjectPortfolioItem', async req => {
    return this.remote.run(req.query, req.data);
});

    return super.init();
  }

  async runRemote(req) {
    return this.remote.run(req.query)
  }

  async createPortifolioItem(req) {
    return this.remote.run(req.query, req.data);
  }
}
