using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(XEx20UserMaintenance.Startup))]
namespace XEx20UserMaintenance
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
