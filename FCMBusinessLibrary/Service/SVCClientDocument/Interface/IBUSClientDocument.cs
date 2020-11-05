using FCMMySQLBusinessLibrary.Model.ModelClientDocument;
using FCMMySQLBusinessLibrary.Service.SVCClientDocument.ServiceContract;
using System.ServiceModel;

namespace FCMMySQLBusinessLibrary.Service.SVCClientDocument.Interface
{
    [ServiceContract]
    public interface IBUSClientDocument
    {
        SCClientDocument.ClientDocumentUpdateResponse ClientDocumentUpdate(ClientDocument clientDocument);
    }
}
