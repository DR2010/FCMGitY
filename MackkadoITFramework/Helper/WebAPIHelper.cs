using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MackkadoITFramework.Utils;
using System.Configuration;

namespace MackkadoITFramework.Helper
{
    public class WebAPIHelper
    {
        private static string gufcWebAPIURI;
        private static string gufcWebAPIURIV2;
        private static string gufcWebAPIURIremote;
        private static string gufcConnectionString;

        public static string GUFCWebAPIURIV2
        {
            get
            {
                if (string.IsNullOrEmpty(gufcWebAPIURIV2))
                {
                    gufcWebAPIURIV2 = ConfigurationManager.AppSettings["gufcapiuriv2"];

                }

                return gufcWebAPIURIV2;
            }
            set
            {
                gufcWebAPIURIV2 = value;
            }
        }


        public static string GUFCWebAPIURI
        {
            get
            {
                if (string.IsNullOrEmpty(gufcWebAPIURI))
                {
                    // gufcWebAPIURI = XmlConfig.GUFCRead(MakConstant.ConfigXml.GUFCWebAPIURI);

                    gufcWebAPIURI = ConfigurationManager.AppSettings["gufcapiuri"];

                }

                return gufcWebAPIURI;
            }
            set
            {
                gufcWebAPIURI = value;
            }
        }

        public static string GUFCWebAPIURIremote
        {
            get
            {
                if (string.IsNullOrEmpty(GUFCWebAPIURIremote))
                {
                    // gufcWebAPIURI = XmlConfig.GUFCRead(MakConstant.ConfigXml.GUFCWebAPIURI);

                    GUFCWebAPIURIremote = ConfigurationManager.AppSettings["gufcapiuriremote"];

                }

                return GUFCWebAPIURIremote;
            }
            set
            {
                GUFCWebAPIURIremote = value;
            }
        }


        public static string GUFCConnectionString
        {
            get
            {
                if (string.IsNullOrEmpty(gufcWebAPIURI))
                {
                    gufcWebAPIURI = XmlConfig.GUFCRead(MakConstant.ConfigXml.GUFCConnectionString);

                }

                return gufcWebAPIURI;
            }
            set
            {
                gufcWebAPIURI = value;
            }
        }

    }
}
