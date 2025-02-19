import { useState } from 'react';
import { isSlotWithItem } from '../../helpers';
import useNuiEvent from '../../hooks/useNuiEvent';
import { Items } from '../../store/items';
import { Slot } from '../../typings';
import Fade from '../utils/Fade';
import WeightBar from '../utils/WeightBar';

const InventoryHotbar: React.FC<{ items: Slot[] }> = ({ items }) => {
  const [hotbarVisible, setHotbarVisible] = useState(false);

  //stupid fix for timeout
  const [handle, setHandle] = useState<NodeJS.Timeout>();
  useNuiEvent('toggleHotbar', () => {
    if (hotbarVisible) {
      setHotbarVisible(false);
    } else {
      if (handle) clearTimeout(handle);
      setHotbarVisible(true);
      setHandle(setTimeout(() => setHotbarVisible(false), 3000));
    }
  });

  return (
    <div className="center-wrapper">
      <Fade visible={hotbarVisible} className="hotbar-grid">
        {items.map((item) => (
          <div
            className="item-container"
            style={{
              backgroundImage: item.metadata?.image
                ? `url(${process.env.PUBLIC_URL + `/images/${item.metadata.image}.png`})`
                : item.name
                ? `url(${process.env.PUBLIC_URL + `/images/${item.name}.png`})`
                : 'none',
            }}
            key={`hotbar-${item.slot}`}
          >
            {isSlotWithItem(item) && (
              <>
                <div className="item-label">
                  {item.metadata?.label
                    ? item.metadata.label
                    : Items[item.name]?.label || item.name}
                </div>
                <div className="item-count">
                  <span id="itemCount">
                    {/* {item.count?.toLocaleString('en-us')}x */}
                    {item.count ? item.count.toLocaleString('en-us') + `x` : ''}
                  </span>
                  <span>
                    {item.weight > 0
                      ? item.weight >= 1000
                        ? `${(item.weight / 1000).toLocaleString('en-us', {
                            minimumFractionDigits: 2,
                          })}`
                        : `${item.weight.toLocaleString('en-us', {
                            minimumFractionDigits: 2,
                          })}`
                      : ''}
                  </span>
                </div>
                {item?.durability !== undefined && (
                  <WeightBar percent={item.durability} durability />
                )}
              </>
            )}
          </div>
        ))}
      </Fade>
    </div>
  );
};

export default InventoryHotbar;
