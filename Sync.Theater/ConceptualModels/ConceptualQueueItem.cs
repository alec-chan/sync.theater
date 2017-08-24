using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sync.Theater.ConceptualModels
{
    public class ConceptualQueueItem
    {
        public string URL { get; set; }
        public int Index { get; set; }

        public ConceptualQueueItem(string URL, int Index)
        {
            this.URL = URL;
            this.Index = Index;
        }
    }
}
