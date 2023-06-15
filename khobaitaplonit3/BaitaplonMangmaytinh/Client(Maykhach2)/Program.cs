using System;
using System.Net.Sockets;
using System.Text;
using System.Threading;

namespace ClientApp
{

    class Client
    {
        private static TcpClient client;
        private static bool isRunning;
        private static string username;
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.UTF8;
            Console.OutputEncoding = Encoding.UTF8;
            Console.Write("Enter username: ");
            username = Console.ReadLine();
            Console.WriteLine("Connecting to server...");
            client = new TcpClient();
            client.Connect("localhost", 8888);
            isRunning = true;
            Console.WriteLine("Connected to server");
            Thread receiveThread = new Thread(new ThreadStart(ReceiveMessages));
            receiveThread.Start();
            Thread sendThread = new Thread(new ThreadStart(SendMessages));
            sendThread.Start();
        }
        private static void ReceiveMessages()
        {
            while (isRunning)
            {
                try
                {
                    byte[] buffer = new byte[1024];
                    int bytesRead = client.GetStream().Read(buffer, 0, buffer.Length);

                    if (bytesRead == 0)
                    {
                        Console.WriteLine("Server disconnected.");
                        client.Close();
                        isRunning = false;
                        break;
                    }
                    string message = Encoding.ASCII.GetString(buffer, 0, bytesRead);
                    Console.WriteLine(message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: {0}", ex.Message);
                    break;
                }
            }
        }
        private static void SendMessages()
        {
            while (isRunning)
            {
                try
                {
                    string message = Console.ReadLine();
                    byte[] buffer = Encoding.ASCII.GetBytes(string.Format("{0} | 1} ", username, message));
                    client.GetStream().Write(buffer, 0, buffer.Length);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error| {0}", ex.Message);
                    break;
                }
            }
        }
    }
}
