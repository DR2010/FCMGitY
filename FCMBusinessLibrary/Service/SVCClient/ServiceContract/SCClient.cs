using FCMMySQLBusinessLibrary.Model.ModelClient;
using MackkadoITFramework.ErrorHandling;
using MackkadoITFramework.Utils;
using System.Collections.Generic;

namespace FCMMySQLBusinessLibrary.Service.SVCClient.ServiceContract
{
    public class ClientListResponse
    {
        public List<Client> clientList;
        public ResponseStatus response;
    }


    public class ClientUpdateRequest
    {
        public HeaderInfo headerInfo;
        public Client eventClient;
    }

    public class ClientUpdateResponse
    {
        public List<Client> clientList;
        public ResponseStatus response;
    }

    public class ClientAddRequest
    {
        public HeaderInfo headerInfo;
        public Client eventClient;
        public string linkInitialSet;
    }

    public class ClientAddResponse
    {
        public ResponseStatus responseStatus;
        public int clientUID;
    }


    public class ClientDeleteRequest
    {
        public HeaderInfo headerInfo;
        public int clientUID;
    }

    public class ClientDeleteResponse
    {
        public ResponseStatus responseStatus;
        public int clientUID;
    }


    public class ClientReadRequest
    {
        public HeaderInfo headerInfo;
        public int clientUID;
    }

    public class ClientReadResponse
    {
        public ResponseStatus responseStatus;
        public Client client;
    }


    public class ReadFieldResponse
    {
        public ResponseStatus responseStatus;
        public string fieldContents;
    }

    public class ReadFieldRequest
    {
        public HeaderInfo headerInfo;
        public string field;
        public int clientUID;
    }
}
