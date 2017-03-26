import PureRenderMixin from 'react-addons-pure-render-mixin';
import { injectIntl, defineMessages } from 'react-intl';
import IconButton from '../../../components/icon_button';

const messages = defineMessages({
  public_short: { id: 'privacy.public.short', defaultMessage: 'Public' },
  public_long: { id: 'privacy.public.long', defaultMessage: 'Post to Public Timelines' },
  unlisted_short: { id: 'privacy.unlisted.short', defaultMessage: 'Unlisted' },
  unlisted_long: { id: 'privacy.unlisted.long', defaultMessage: 'Do not show in public timelines' },
  private_short: { id: 'privacy.private.short', defaultMessage: 'Private' },
  private_long: { id: 'privacy.private.long', defaultMessage: 'Post to followers only, cannot be boosted' },
  direct_short: { id: 'privacy.direct.short', defaultMessage: 'Direct' },
  direct_long: { id: 'privacy.direct.long', defaultMessage: 'Post to mentioned users only' }
});

const PrivacyDropdown = React.createClass({

  propTypes: {
    value: React.PropTypes.string.isRequired,
    onChange: React.PropTypes.func.isRequired,
    intl: React.PropTypes.object.isRequired
  },

  getInitialState () {
    return {
      open: false
    };
  },

  mixins: [PureRenderMixin],

  handleToggle () {
    this.setState({ open: !this.state.open });
  },

  handleClick (value, e) {
    e.preventDefault();
    this.setState({ open: false });
    this.props.onChange(value);
  },

  onGlobalClick (e) {
    if (e.target !== this.node && !this.node.contains(e.target) && this.state.open) {
      this.setState({ open: false });
    }
  },

  componentDidMount () {
    window.addEventListener('click', this.onGlobalClick);
    window.addEventListener('touchstart', this.onGlobalClick);
  },

  componentWillUnmount () {
    window.removeEventListener('click', this.onGlobalClick);
    window.removeEventListener('touchstart', this.onGlobalClick);
  },

  setRef (c) {
    this.node = c;
  },

  render () {
    const { value, onChange, intl } = this.props;
    const { open } = this.state;

    const options = [
      { icon: 'globe', value: 'public', shortText: intl.formatMessage(messages.public_short), longText: intl.formatMessage(messages.public_long) },
      { icon: 'unlock-alt', value: 'unlisted', shortText: intl.formatMessage(messages.unlisted_short), longText: intl.formatMessage(messages.unlisted_long) },
      { icon: 'lock', value: 'private', shortText: intl.formatMessage(messages.private_short), longText: intl.formatMessage(messages.private_long) },
      { icon: 'paper-plane', value: 'direct', shortText: intl.formatMessage(messages.direct_short), longText: intl.formatMessage(messages.direct_long) }
    ];

    const valueOption = options.find(item => item.value === value);

    return (
      <div ref={this.setRef} className={`privacy-dropdown ${open ? 'active' : ''}`}>
        <div className='privacy-dropdown__value'><IconButton icon={valueOption.icon} size={22} active={open} inverted onClick={this.handleToggle} /></div>
        <div className='privacy-dropdown__dropdown'>
          {options.map(item =>
            <div key={item.value} onClick={this.handleClick.bind(this, item.value)} className={`privacy-dropdown__option ${item.value === value ? 'active' : ''}`}>
              <div className='privacy-dropdown__option__icon'><i className={`fa fa-fw fa-${item.icon}`} /></div>
              <div className='privacy-dropdown__option__content'>
                <strong>{item.shortText}</strong>
                {item.longText}
              </div>
            </div>
          )}
        </div>
      </div>
    );
  }

});

export default injectIntl(PrivacyDropdown);
