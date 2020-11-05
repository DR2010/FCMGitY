using FCMMySQLBusinessLibrary.Service.SVCClient.Contract;
using FCMMySQLBusinessLibrary.Service.SVCClient.ServiceContract;
using System.ServiceModel;

namespace FCMMySQLBusinessLibrary.Service.SVCClient.Interface
{
    [ServiceContract]
    public interface IBUSClientDetails
    {
        [OperationContract]
        ClientAddResponse ClientAdd(ClientAddRequest clientAddRequest);
        ClientUpdateResponse ClientUpdate(ClientUpdateRequest clientUpdateRequest);

    }
}
