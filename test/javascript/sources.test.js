import { shallowMount } from "@vue/test-utils";
import Index from 'components/sources/Index';
import Show from 'components/sources/Show';
import Create from 'components/sources/Create';
import Edit from 'components/sources/Edit';
import Form from 'components/sources/Form';

describe('Sources CRUD test', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render Show', () => {
        const wrapper = shallowMount(Show);
        expect(wrapper).not.toBeNull();
    });

    it('should render Create', () => {
        const wrapper = shallowMount(Create);
        expect(wrapper).not.toBeNull();
    });

    it('should render Edit', () => {
        const wrapper = shallowMount(Edit);
        expect(wrapper).not.toBeNull();
    });
});