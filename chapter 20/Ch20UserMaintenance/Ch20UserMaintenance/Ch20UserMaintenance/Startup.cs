using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Ch20UserMaintenance.Startup))]
namespace Ch20UserMaintenance
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
