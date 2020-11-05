using FCMMySQLBusinessLibrary.Model.ModelClient;
using FCMMySQLBusinessLibrary.Model.ModelClientDocument;
using MackkadoITFramework.ErrorHandling;
using MackkadoITFramework.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FCMMySQLBusinessLibrary.Service.SVCClientDocument.ServiceContract
{
    public class SCClientDocument
    {
        public class ClientDocumentReadRequest
        {
            public HeaderInfo headerInfo;
            public ClientDocument clientDocument;
        }

        public class ClientDocumentReadResponse
        {
            public ResponseStatus responseStatus;
            public ClientDocument clientDocument;
        }

        public class ClientDocumentUpdateRequest
        {
            public HeaderInfo headerInfo;
            public ClientDocument clientDocument;
        }

        public class ClientDocumentUpdateResponse
        {
            public ResponseStatus responseStatus;
            public ClientDocument clientDocument;
        }

    }
}
