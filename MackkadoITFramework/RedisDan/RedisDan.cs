using ServiceStack.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StackExchange.Redis;

namespace MackkadoITFramework.RedisDan
{
    public class RedisDan
    {
        ConnectionMultiplexer redis;
        IDatabase db;
        int databaseid;
        StackExchange.Redis.IServer redisserver;
        public RedisDan(int dbid, string cachetarget = "local") 
        {
            string cachetouse = "danielw10-s37p2ob0.cloudapp.net,allowAdmin=true";
            string cachedbserver = "danielw10-s37p2ob0.cloudapp.net:6379";

            if (cachetarget == "remote")
            {
                cachetouse = "danielw10-s37p2ob0.cloudapp.net,allowAdmin=true";
                cachedbserver = "danielw10-s37p2ob0.cloudapp.net:6379";
            }
            //if (cachetarget == "local")
            //{
            //    cachetouse = "172.16.0.30,allowAdmin=true";
            //    cachedbserver = "172.16.0.30:6379";
            //}
            if (cachetarget == "local")
            {
                cachetouse = "localhost,allowAdmin=true";
                cachedbserver = "localhost:6379";
            }

            databaseid = dbid;
            redis = ConnectionMultiplexer.Connect(cachetouse);
            db = redis.GetDatabase( dbid );
            redisserver = redis.GetServer(cachedbserver);

        }


        public void flushdb()
        {
            redisserver.FlushDatabase(databaseid);
        }

        // POST: api/Redis 
        public bool Post(string key, string keyValue)
        {
            return db.StringSet(key, keyValue);

            //redis.SetEntry(key, keyValue);
            //using (var redis = new RedisClient("danielw10-s37p2ob0.cloudapp.net", 6379))
            //{
            //    redis.SetEntry(key, keyValue);
            //}
        }

        // GET: api/Redis/key 
        public string Get(string key)
        {
            return db.StringGet(key);

            //using (var redis = new RedisClient("danielw10-s37p2ob0.cloudapp.net", 6379))
            //{
            //    return redis.GetEntry(key);
            //}
        }

        public string Delete(string key)
        {

            db.KeyDelete(key);

            return "";

            //using (var redis = new RedisClient("danielw10-s37p2ob0.cloudapp.net", 6379))
            //{
            //    return redis.GetEntry(key);
            //}
        }


    }
}
