using { CapexService } from './capex';

extend projection CapexService.CapexRequest with {
    virtual enableSubmit : Boolean
}
