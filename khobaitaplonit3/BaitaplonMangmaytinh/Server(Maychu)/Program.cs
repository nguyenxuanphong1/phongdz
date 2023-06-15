using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Text;
using System.Collections.Generic;
public class Server
{
    private static TcpListener tcpListener;
    private static Thread listenThread;
    private static readonly List<TcpClient> clients = new List<TcpClient>();
    public static void Main()
    {
        Console.InputEncoding = Encoding.UTF8;
        Console.OutputEncoding = Encoding.UTF8;
        tcpListener = new TcpListener(IPAddress.Any, 8888);
        listenThread = new Thread(new ThreadStart(ListenForClients));
        listenThread.Start();
    }
    private static void ListenForClients()
    {
        tcpListener.Start();
        Console.WriteLine(" Welcome to the server ");
        while (true)
        {
            TcpClient client = tcpListener.AcceptTcpClient();
           
            Console.WriteLine( client.Client.Ttl);
            clients.Add(client);
            Thread clientThread = new Thread(new ParameterizedThreadStart(HandleClientComm));
            clientThread.Start(client);
        }
    }
    private static void HandleClientComm(object client)
    {
        TcpClient tcpClient = (TcpClient)client;
        NetworkStream clientStream = tcpClient.GetStream();
        byte[] message = new byte[4096];
        int bytesRead;
        while (true)
        {
            bytesRead = 0;
            try
            {
                bytesRead = clientStream.Read(message, 0, 4096);
            }
            catch
            {
                break;
            }
            if (bytesRead == 0)
            {
                break;
            }
            string data = Encoding.ASCII.GetString(message, 0, bytesRead);
            Console.WriteLine("Received| {0}", data);
            foreach (TcpClient c in clients)
            {
                NetworkStream stream = c.GetStream();
                byte[] buffer = Encoding.ASCII.GetBytes(data);
                stream.Write(buffer, 0, buffer.Length);
            }
        }
        clients.Remove(tcpClient);
        tcpClient.Close();
    }
}
