using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sync.Theater.EntityDataModels;

namespace Sync.Theater.ConceptualModels
{
    public class ConceptualQueue
    {
        
        public string QueueName { get; set; }
        public int CurrentIndex { get; set; }
        public List<ConceptualQueueItem> QueueItems { get; set; }

        public ConceptualQueue(string QueueName, int CurrentIndex, string[] URLs)
        {
            this.QueueName = QueueName;
            this.CurrentIndex = CurrentIndex;
            this.QueueItems = new List<ConceptualQueueItem>();
            for(int i = 0; i<URLs.Length; i++)
            {
                QueueItems.Add(new ConceptualQueueItem(URLs[i], i));
            }
        }

        public static Queue ConceptualQueueToQueue(ConceptualQueue cQueue)
        {
            var queue = new Queue();

            queue.CurrentIndex = cQueue.CurrentIndex;
            queue.QueueName = cQueue.QueueName;
            foreach(ConceptualQueueItem cqi in cQueue.QueueItems)
            {
                var qi = new QueueItem();
                qi.URL = cqi.URL;
                qi.Index = cqi.Index;
                
            }
        }

    }
}
