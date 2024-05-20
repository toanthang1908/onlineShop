using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(onlineShop.Startup))]
namespace onlineShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
