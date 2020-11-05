using FCMMySQLBusinessLibrary.Service.SVCClient.Contract;
using FCMMySQLBusinessLibrary.Service.SVCClient.ServiceContract;
using MackkadoITFramework.Utils;
using System.ServiceModel;

namespace FCMMySQLBusinessLibrary.Service.SVCClient.Interface
{
    [ServiceContract]
    public interface IBUSClientList
    {
        [OperationContract]
        ClientListResponse ClientList(HeaderInfo headerInfo);

    }
}
